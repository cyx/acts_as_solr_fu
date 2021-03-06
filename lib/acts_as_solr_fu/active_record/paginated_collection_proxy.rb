class ActsAsSolrFu::ActiveRecord::PaginatedCollectionProxy
  include Enumerable
  
  attr_reader :per_page, :current_page, :search_results
  
  def initialize(search_results, current_page, per_page)
    @search_results, @current_page, @per_page = search_results, current_page, per_page
  end

  def empty?
    @search_results.nil? || @search_results.results.empty?
  end
  
  def current_page
    @current_page
  end

  def previous_page
    @current_page - 1
  end
  
  def next_page
    @current_page + 1
  end
  
  def total_entries
    @search_results.total
  end
  
  def results
    @search_results.results
  end
  
  def page_count
    (total_entries / @per_page.to_f).ceil
  end
  
  def each
    @search_results.results.each { |result| yield result }
  end
  
  def in_groups_of(number, &block)
    each_slice(number, &block)
  end
end

