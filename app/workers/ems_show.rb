class EmsShow
  @queue = :ems_queue
  def self.perform(water_id)
    water = Water.find(water_id)
    result = HTTParty.post('http://131.181.156.32/Ion/default.aspx/GetRTxmlData'.to_str, :body => { :dgm => water.dgm, :id => '', :node => water.node}.to_json, :headers => {'Content-Type' => 'application/json' } )["d"]
    #result = RestClient.post 'http://131.181.156.32/Ion/default.aspx/GetRTxmlData', { 'dgm' => water.dgm, 'id' => '', 'node' => water.node}.to_json, :content_type => :json, :accept => :json
    water[:ems_result] = result
    water.save
  end
end
