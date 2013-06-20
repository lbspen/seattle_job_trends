shared_context 'stub nokogiri' do
  def stub_nokogiri(method, success = true)
    Nokogiri.stub!(method).and_return(success)
    Snapshot.any_instance.stub(:create_url).and_return("http://www.google.com")
  end
end
