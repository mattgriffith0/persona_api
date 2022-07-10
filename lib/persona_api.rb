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

  # resources
  autoload :AccountsResource, "persona_api/resources/accounts"
  autoload :InquiriesResource, "persona_api/resources/inquiries"
  autoload :VerificationsResource, "persona_api/resources/verifications"
  autoload :CasesResource, "persona_api/resources/cases"
end
