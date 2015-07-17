# lib/ajax-datatables-rails/orm/mongoid.rb
 
module AjaxDatatablesRails
  module ORM
    module Mongoid
      def fetch_records
        get_raw_records
      end
 
      def filter_records(records)
        records = simple_search(records)
        #records = composite_search(records)
        records
      end
 
      def sort_records(records)
        sort_by = []
        params[:order].each_value do |item|
          sort_by << "#{sort_column(item)} #{sort_direction(item)}"
        end
        records.order_by(sort_by.join(", "))
      end
 
      def paginate_records(records)
        records.skip(offset).limit(per_page)
      end
 
      # ----------------- SEARCH HELPER METHODS --------------------
 
      def simple_search(records)
        return records unless search_query_present?
        #conditions = build_conditions_for(params[:search][:value], params[:search][:regex])
        #raise params[:search][:value].inspect
        records = records.where(:location.name => /#{params[:search][:value]}/i) if params[:search]
        records
      end
 
      def composite_search(records)
        # fill in the blanks if required
        # safe to delete method if not needed
      end
 
      def build_conditions_for(query, regex)
        search_for = query.split(' ')
        criteria = search_for.inject([]) do |criteria, atom|
          raise criteria.inspect
          criteria << searchable_columns.map { |col| search_condition(col, atom, regex == 'true') }
          .reduce(:or)
        end.reduce(:and)
        criteria
      end
 
      def aggregate_query
        # fill in the blanks if required
        # safe to delete method if not needed
      end
 
      def search_condition(column, value, regex=false)
        # fill in the blanks if required
        # safe to delete method if not needed
      end
 
      def get_table(model)
        # fill in the blanks if required
        # safe to delete method if not needed
        # not at all sure if this would be required
      end
 
      def table_from_downcased(model)
        # fill in the blanks if required
        # safe to delete method if not needed
        # not at all sure if this would be required
      end
 
      def typecast
        # fill in the blanks if required
        # safe to delete method if not needed
        # not at all sure if this would be required
      end
 
      def regex_search(table, column, value)
        # fill in the blanks if required
        # safe to delete method if not needed
      end
 
      def non_regex_search(table, column, value)
        # fill in the blanks if required
        # safe to delete method if not needed
      end
 
      # ----------------- SORT HELPER METHODS --------------------
 
      def sort_column(item)
        #raise view_columns[item[:column].to_i].split('.').inspect
        model, column = view_columns[item[:column].to_i].split('.')
        column
        #raise model.inspect
        #table = get_table(model)
        #[table.name, column].join('.')
      end
 
      def sort_direction(item)
        options = %w(desc asc)
        options.include?(item[:dir]) ? item[:dir].upcase : 'ASC'
      end
    end
  end
end
