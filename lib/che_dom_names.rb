module Che  
  module DomNames
    def dom_id(prefix = nil, postfix = nil, dom_name = self.class.name.underscore)
      prefix(prefix) + "#{dom_name}_#{id}" + postfix(postfix)
    end
    
    def dom_class(prefix = nil, singular = true)      
      prefix(prefix) + ((singular == true) ? self.class.name.underscore.singularize : self.class.name.underscore.pluralize)
    end
    
    def dom_path
      self.class.name.underscore.pluralize
    end
    
    private
      
      def prefix(prefix)
        prefix.blank? ? "" : "#{prefix}_"
      end
      
      def postfix(postfix)
        postfix.blank? ? "" : "_#{postfix}"
      end
  end
end