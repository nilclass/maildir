require 'test_helper'
require 'maildir/subdirs'
class TestSubdirs < Test::Unit::TestCase
  context "A maildir" do
    setup do
      FakeFS::FileSystem.clear
      @maildir = temp_maildir
      setup_subdirs(@maildir)
    end

    should "have subdirs" do
      assert @maildir.subdirs.any?
    end

    should "be called INBOX" do
      assert @maildir.name == 'INBOX'
    end

    should "include direct subdirs" do
      subdir_names = @maildir.subdirs.map(&:name)
      assert subdir_names.include?('a') && subdir_names.include?('b')
    end

    should "not include deeper subdirs" do
      subdir_names = @maildir.subdirs.map(&:name)
      assert ! subdir_names.include?('x') && ! subdir_names.include?('a.x')
    end

    should "create more subdirs" do
      @maildir.create_subdir("test")
      assert @maildir.subdirs.map(&:name).include?("test")
    end

    should "find the subdir by path" do
      assert_nothing_raised do
        @maildir.subdir_by_path('a.x')
      end
    end

    should "raise MaildirNotFound" do
      assert_raise Maildir::Subdirs::MaildirNotFound do
        @maildir.subdir_by_path('a.b.c')
      end
    end

    should "return the mailbox itself" do
      assert @maildir.subdir_by_path('INBOX') == @maildir
    end
  end

  context "A subdir" do
    setup do
      FakeFS::FileSystem.clear
      @maildir = temp_maildir
      setup_subdirs(@maildir)
    end

    should "include more subdirs" do
      assert_not_empty @maildir.subdirs.select{ |sd| sd.name == 'a'}.first.subdirs
    end
  end
end
