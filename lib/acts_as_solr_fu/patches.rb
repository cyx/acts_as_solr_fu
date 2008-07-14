ActsAsSolr::InstanceMethods.module_eval do
  def add_includes(doc)
    if configuration[:include].is_a?(Array)
      configuration[:include].each do |association|
        records = [ self.send(association) ].flatten
        unless records.empty?
          doc["#{association}_t"] = records.collect do |r| 
            ERB::Util.html_escape(r.to_s) 
          end.join("\n")
        end
      end
    end
  end
end