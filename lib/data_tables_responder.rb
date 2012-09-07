require "data_tables_responder/engine"

module DataTablesResponder
  def to_data_table
    params = request.filtered_parameters

    total_records = resource.count

    query_scope = resource
    query_scope = query_scope.q params['sSearch'] if params['sSearch']

    total_display_records = query_scope.count

    result = query_scope
    result = result.offset  params['iDisplayStart']   if params['iDisplayStart']
    result = result.limit   params['iDisplayLength']  if params['iDisplayLength']

    render :json => {
      :aaData               => result,
      :iTotalDisplayRecords => total_display_records,
      :iTotalRecords        => total_records
    }
  end
end
