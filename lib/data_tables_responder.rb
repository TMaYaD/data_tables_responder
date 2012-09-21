require "data_tables_responder/engine"

module DataTablesResponder
  def to_data_table
    params = request.filtered_parameters

    total_records = resource.except(:limit).count

    query_scope = resource
    query_scope = query_scope.q params['sSearch'] if params['sSearch'] && query_scope.respond_to?(:q)

    total_display_records = query_scope.except(:limit).count

    result = query_scope

    if params['iDisplayStart'] && params['iDisplayLength']
      result = result.offset(params['iDisplayStart']).limit(params['iDisplayLength'])
    end

    render :json => {
      :aaData               => result,
      :iTotalDisplayRecords => total_display_records,
      :iTotalRecords        => total_records
    }, :content_type => Mime::JSON.to_s
  end
end
