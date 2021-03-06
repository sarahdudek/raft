require 'rails_helper'

describe EventsController do
  let!(:event) { Event.create!(location: "space", date: "yellow", time: "hello", name: "It Dinner Yo", host_id: 1, group_id: 1)}
  let!(:group) { Group.create!(admin_id: 1, name: "yolo")}

  describe "GET #index"  do
    it "responds with status code 200" do
      get :index, { group_id: 1 }
      expect(response).to have_http_status 200
    end
  end

  describe "GET #show"  do
    it "responds with status code 200" do
      get :show, { group_id: 1, id: 1 }
      expect(response).to have_http_status 200
    end
  end

  describe "GET #new"  do
    it "responds with status code 200" do
      get :new, { group_id: 1 }
      expect(response).to have_http_status 200
    end

    it "renders the new events template" do
      get :new, { group_id: 1 }
      expect(response).to render_template(:new)
  end

  # describe "POST #create"  do
  #   it "responds with status code 302" do
  #     event.group_id = 1
  #     post :create, { group_id: 1, event: event }
  #     expect(response).to have_http_status 302
  #   end
  # end

  #   it "responds with status code 422 when it fails" do
  #     event.group_id = 1
  #     post :create, { group_id: 1 }
  #     expect(response).to have_http_status 422
  #   end

     describe "delete #destroy"  do
      it "deletes event" do
        delete :destroy, { group_id: 1, id: event.id }
        expect(response).to have_http_status 302
      end

      it "destroys the requested game" do
        expect { delete(:destroy, { group_id: 1, id: event.id }) }.to change(Event, :count).by(-1)
      end

      it "sets a notice that the event was destroyed" do
        delete :destroy, { group_id: 1, id: event.id}
        expect(flash[:notice]).to match /Event was successfully destroyed./
      end

      it "redirects to the games list" do
        delete :destroy, { group_id: 1, id: event.id }
        expect(response).to redirect_to group_events_path
      end

    end
  end
end
