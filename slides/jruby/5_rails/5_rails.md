!SLIDE

# ¡Rails!

!SLIDE

# Web framework for Ruby

!SLIDE

# Convention over configuration

!SLIDE

# Opionated framework

!SLIDE bullets incremental

# Full stack

* MVC
* ORM
* Ajax
* REST
* Testing

!SLIDE

# ¡Rails 3!

## Forget about the past

!SLIDE

# Decoupled

    @@@ruby
    #require 'rails/all'
    #require "active_record/railtie"
    require "action_controller/railtie"
    require "action_mailer/railtie"
    require "active_resource/railtie"
    require "rails/test_unit/railtie"

    config.generators do |g|
    #   g.orm             :active_record
       g.template_engine :haml
    #   g.test_framework  :test_unit, :fixtures => true
    end


!SLIDE

# Bundler

## Dependencies management

!SLIDE

    @@@ruby
    source 'http://rubygems.org'

    gem 'rails', '3.0.0.beta3'

!SLIDE

# Routes

    @@@ruby
    resources :products do
      member do
        get :short
        post :toggle
      end
    end

!SLIDE

# Models

    @@@ruby
    class Product < ActiveRecord::Base
    end

!SLIDE

# Migrations

## TODO

    @@@ruby
    class CreateProduct < ActiveRecord::Migration
      def self.up
        create_table :products do |t|
          t.string :name
          t.text :description

          t.timestamps
        end
      end

      def self.down
        drop_table :products
      end
    end

!SLIDE

# Query language

    @@@ruby
    Product.find(:name => 'wadus')

    Poduct.
      where(:name => 'wadus').
      order('products.id DESC')

!SLIDE

# Controllers

    @@@ruby
    class ProductsController < ApplicationController
      def index; end
      def new; end
      def create; end
      def show; end
      def edit; end
      def delete; end
    end

!SLIDE

# Views

    @@@ruby
    <html>
      <body>
        <% @products.each do |product| %>
        <% end %>
      </body>
    </html>

!SLIDE

# Lets write some code
