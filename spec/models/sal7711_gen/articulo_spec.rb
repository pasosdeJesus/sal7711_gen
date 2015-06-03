# encoding: UTF-8
require 'rails_helper'

module Sal7711Gen
  RSpec.describe Articulo, :type => :model do

    it "valido" do
      articulo = FactoryGirl.build(:sal7711_gen_articulo)
      expect(articulo).to be_valid
      articulo.destroy
    end

    it "no valido" do
      articulo = 
        FactoryGirl.build(:sal7711_gen_articulo, fecha: nil)
      expect(articulo).not_to be_valid
      articulo.destroy
    end

  end
end
