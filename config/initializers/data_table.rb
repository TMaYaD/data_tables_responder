Mime::Type.register 'application/data_table', :data_table

ActionController::Responder.send :include, DataTablesResponder
InheritedResources::Responder.send :include, DataTablesResponder if defined? InheritedResources
