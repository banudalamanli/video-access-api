require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe VideosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Video. As you add validations to Video, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { title: "title", desc: "description" }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET #index" do
    xit "assigns all videos as @videos" do
      video = Video.create!
      get :index, {}
      expect(assigns(:videos)).to eq([video])
    end
  end

  describe "POST #create" do
    context "with valid params" do
      xit "creates a new Video" do
        expect {
          post :create, {:video => valid_attributes}
        }.to change(Video, :count).by(1)
      end

      xit "assigns a newly created video as @video" do
        post :create, {:video => valid_attributes}
        expect(assigns(:video)).to be_a(Video)
        expect(assigns(:video)).to be_persisted
      end
    end

    context "with invalid params" do
      xit "assigns a newly created but unsaved video as @video" do
        post :create, {:video => invalid_attributes}
        expect(assigns(:video)).to be_a_new(Video)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested video" do
        video = Video.create! valid_attributes
        put :update, {:id => video.to_param, :video => new_attributes}
        video.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested video as @video" do
        video = Video.create! valid_attributes
        put :update, {:id => video.to_param, :video => valid_attributes}
        expect(assigns(:video)).to eq(video)
      end
    end

    context "with invalid params" do
      it "assigns the video as @video" do
        video = Video.create! valid_attributes
        put :update, {:id => video.to_param, :video => invalid_attributes}
        expect(assigns(:video)).to eq(video)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested video" do
      video = Video.create! valid_attributes
      expect {
        delete :destroy, {:id => video.to_param}
      }.to change(Video, :count).by(-1)
    end
  end

end