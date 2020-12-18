module Api
  module V1
    class RestaurantsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_restaurant, only: %i[show update destroy]
      def index
        @restaurant = Restaurant.all
        render_json_success('displaye')
      end

      def show
        render_json_success('loade')
      end

      def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
          render_json_success('create')
        else
          render_json_error('create')
        end
      end

      def destroy
        if @restaurant.destroy
          render_json_success('delete')
        else
          render_json_error('delete')
        end
      end

      def update
        if @restaurant.update_attributes(restaurant_params)
          render_json_success('update')
        else
          render_json_error('update')
        end
      end

      private

      def restaurant_params
        params.require(:restaurant).permit(:name, :price, :style, :address)
      end

      def render_json_success(action)
        render json: { status: 'SUCCESS', message: "#{action.capitalize}d restaurant", data: @restaurant }, status: :ok
      end

      def render_json_error(action)
        render json: { status: 'ERROR',
                       message: "Restaurant not #{action}d",
                       data: @restaurant.errors }, status: :unprocessable_entity
      end

      def set_restaurant
        @restaurant = Restaurant.find(params[:id])
      end
    end
  end
end
