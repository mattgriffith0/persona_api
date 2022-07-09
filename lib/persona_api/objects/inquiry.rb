module PersonaApi
  class Inquiry < Object
    def account
      # return the account id token associated with this inquiry
      relationships.account.data.id
    end

    def completed?
      attributes.completed_at.nil? ? false : true
    end
    
    def expired?
      attributes.expired_at.nil? ? false : true
    end

    def failed?
      attributes.failed_at.nil? ? false : true
    end
    
    def redacted?
      attributes.redacted_at.nil? ? false : true
    end

    def started?
      attributes.started_at.nil? ? false: true
    end
  end
end