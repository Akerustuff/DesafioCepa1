require 'rails_helper'

RSpec.describe "Wines", type: :request do

before :each do
    @user =User.create(email: "peter@email.com", password: "1q2w3e4r", password_confirmation: "1q2w3e4r", admin: true)
    login_as(@user)
end

    context "get index (show wines)" do
        it "assigns @wines" do
            wine = Wine.create({
                name: "Carmenere",
                score: 50,
                created_at: DateTime.now,
                updated_at: DateTime.now
            })
            get wines_path
            expect(assigns(:wines)).to eq([wine])
            end

        it "renders the index template" do
            get wines_path
            expect(response).to render_template("index")
        end
    end

    describe "show index" do
        it "renders the template" do
            wine = Wine.create({
                name: "Casillero",
                score: 70,
                created_at: DateTime.now,
                updated_at: DateTime.now
            })
            get wine_path(wine.id)
            expect(response).to render_template :show
        end
    end
end
