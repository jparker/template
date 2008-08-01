require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do
  describe '#title' do
    it 'escapes content' do
      helper.title('<foo>').should == '&lt;foo&gt;'
    end
  end
  
  describe '#link_to_show' do
    it 'links to the given path' do
      helper.link_to_show('/foo').should have_tag('a[href=?]', '/foo')
    end
    
    it 'has "show" in the link text' do
      helper.link_to_show('/foo').should have_tag('a', 'show')
    end
  end
  
  describe '#link_to_edit' do
    it 'links to the given path' do
      helper.link_to_edit('/foo').should have_tag('a[href=?]', '/foo')
    end
    
    it 'has "edit" in the link text' do
      helper.link_to_edit('/foo').should have_tag('a', 'edit')
    end
  end
  
  describe '#link_to_destroy' do
    it 'links to the given path' do
      helper.link_to_destroy('/foo').should have_tag('a[href=?]', '/foo')
    end
    
    it 'has "delete" in the link text' do
      helper.link_to_destroy('/foo').should have_tag('a', 'delete')
    end
    
    it 'uses DELETE and generates a confirmation popup' do
      helper.should_receive(:link_to).with('delete', '/foo', hash_including(:method => :delete, :confirm => "This can't be undone. Really delete?"))
      helper.link_to_destroy('/foo')
    end
  end
end
