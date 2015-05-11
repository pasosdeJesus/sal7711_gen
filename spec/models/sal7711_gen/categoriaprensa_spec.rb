# encoding: UTF-8
require 'rails_helper'

module Sal7711Gen
  RSpec.describe Categoriaprensa, :type => :model do

    it "valido" do
      categoriaprensa = FactoryGirl.build(:sal7711_gen_categoriaprensa)
      expect(categoriaprensa).to be_valid
      categoriaprensa.destroy
    end

    it "no valido" do
      categoriaprensa = 
        FactoryGirl.build(:sal7711_gen_categoriaprensa, nombre: '')
      expect(categoriaprensa).not_to be_valid
      categoriaprensa.destroy
    end

    it "existente" do
      categoriaprensa = Sal7711Gen::Categoriaprensa.where(id: 3).take
      expect(categoriaprensa.codigo).to eq("A11")
    end

  end
end
