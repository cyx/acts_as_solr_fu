module ActsAsSolrFu
  module ActiveRecord
    module Pagination
      def self.included(ar)
        ar.extend ClassMethods
      end
  
      module ClassMethods 
        def paginate_by_solr(*args)
          options   = args.extract_options!
          per_page  = (options.delete(:per_page) || 10).to_i
          page      = (options.delete(:page) || 1).to_i
  
          options.merge!(:offset => (page - 1) * per_page, :limit => per_page)
          args << options
          
          if args.first.blank?
            return nil
          else
            ActsAsSolrFu::ActiveRecord::PaginatedCollectionProxy.new(find_by_solr(*args), page, per_page)
          end
        end
      end
    end
  end
end