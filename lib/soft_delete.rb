module SoftDelete
  def self.vanish(params)
    if params[:controller]=='lists'
      @obj = List.find(params[:list_id])
    else
      @obj = ListItem.find(params[:list_item_id])
    end
    if params[:service].present?
      @obj.status= "true"
    else
      @obj.status= "false"
    end
    @obj.save
  end
end
