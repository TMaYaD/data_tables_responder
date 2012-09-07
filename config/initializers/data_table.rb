Mime::Type.register 'application/json', :data_table

ActionController::Responder.send :include, DataTablesResponder
InheritedResources::Responder.send :include, DataTablesResponder if defined? InheritedResources
