# frozen_string_literal: true

require_relative "persona_api/version"

module PersonaApi
  autoload :Client, "persona_api/client"
  autoload :Collection, "persona_api/collection"
  autoload :Error, "persona_api/error"
  autoload :Object, "persona_api/object"
  autoload :Resource, "persona_api/resource"

  # objects
  autoload :Account, "persona_api/objects/account"
  autoload :Inquiry, "persona_api/objects/inquiry"
  autoload :Verification, "persona_api/objects/verification"
  autoload :Case, "persona_api/objects/case"
  autoload :Document, "persona_api/objects/document"
  autoload :Report, "persona_api/objects/report"
  autoload :File, "persona_api/objects/file"
  autoload :Event, "persona_api/objects/event"
  autoload :List, "persona_api/objects/list"
  autoload :ApiLog, "persona_api/objects/api_log"
  autoload :UserAuditLog, "persona_api/objects/user_audit_log"
  autoload :ListItem, "persona_api/objects/list_item"

  # resources
  autoload :AccountsResource, "persona_api/resources/accounts"
  autoload :InquiriesResource, "persona_api/resources/inquiries"
  autoload :VerificationsResource, "persona_api/resources/verifications"
  autoload :CasesResource, "persona_api/resources/cases"
  autoload :DocumentsResource, "persona_api/resources/documents"
  autoload :ReportsResource, "persona_api/resources/reports"
  autoload :FilesResource, "persona_api/resources/files"
  autoload :EventsResource, "persona_api/resources/events"
  autoload :ListsResource, "persona_api/resources/lists"
  autoload :ApiLogsResource, "persona_api/resources/api_logs"
  autoload :UserAuditLogsResource, "persona_api/resources/user_audit_logs"
  autoload :ListItemsResource, "persona_api/resoruces/list_items"
end
