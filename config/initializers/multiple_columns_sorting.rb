module ActiveAdmin
  class ResourceController < BaseController
    module DataAccess
      def apply_sorting(chain)
        params[:order] ||= active_admin_config.sort_order

        orders = []
        params[:order].split('_and_').each do |fragment|
          order_clause = active_admin_config.order_clause.new(active_admin_config, fragment)
          if order_clause.valid?
            orders << order_clause.to_sql
          end
        end

        if orders.empty?
          chain
        else
          chain.reorder(orders.shift).order(orders)
        end
      end
    end
  end
end

