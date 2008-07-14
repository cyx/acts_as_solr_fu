require File.dirname(__FILE__) + '/lib/acts_as_solr_fu/active_record/pagination'
require File.dirname(__FILE__) + '/lib/acts_as_solr_fu/active_record/paginated_collection_proxy'
require File.dirname(__FILE__) + '/lib/acts_as_solr_fu/patches'

ActiveRecord::Base.send :include, ActsAsSolrFu::ActiveRecord::Pagination