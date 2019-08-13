require 'rails_helper'

RSpec.describe list_itemsController, type: :controller do

  describe 'before actions' do
    describe 'set_list' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:set_list)
      end
    end
  end

  # index action
  describe 'GET #index' do
    before do
      get :index
    end

    it 'is expected to assign List instance variable' do
      expect(assigns[:list_list_items]).to eq(list_list_item.all)
    end
  end

  # new action
  describe 'GET #new' do
    before do
      get :new
    end

    it 'is expected to assign List as new instance variable' do
      expect(assigns[:list_list_item]).to be_instance_of(list_list_item)
    end

    it 'renders new template' do
      is_expected.to render_template(:new)
    end

    it 'renders application layout' do
      is_expected.to render_template(:application)
    end
  end

  # create action
   describe 'POST #create' do
     before do
       post :create, params: params
     end

     context 'when params are correct' do
       let(:params) { { list_list_item: { name: "kolkata" } } }

       it 'is expected to create new List successfully' do
         expect(assigns[:list_item]).to be_instance_of(list_list_item)
       end

       it 'is expected to have name assigned to it' do
         expect(assigns[:list_item].name).to eq('kolkata')
       end

       it 'is expected to redirect to list_item_items path' do
         is_expected.to redirect_to list_items_path
       end
     end

       it 'is expected to add errors to name attribute' do
         expect(assigns[:list_item_item].errors[:name]).to eq(['can\'t be blank'])
       end
   end

   # update action
  describe 'PATCH #update' do

    before do
      # something that you want to execute before running `it` block
      patch :update, params: params
    end

    context 'when list_item_item not found' do

      it 'is expected to redirect_to list_items path' do
        is_expected.to redirect_to(list_items_path)
      end

      it 'is expected to set flash' do
        expect(flash[:notice]).to eq('List not found.')
      end
    end

    context 'when list_item_item exist in database' do
      let(:list_item) { FactoryBot.create :list_item }
      let(:params) { { id: list_item.id, list_item: { name: 'test name' } } }

      context 'when data is provided is valid' do
        it 'is expected to update list_item' do
          expect(list_item.reload.name).to eq('test name')
        end

        it 'is_expected to redirect_to list_items_path' do
          is_expected.to redirect_to(list_items_path)
        end
      end

      context 'when data is invalid' do
        let(:list_item) { FactoryBot.create :list_item }
        let(:params) { { id: list_item.id, list_item: { name: '' } } }

        it 'is expected not to update list_item name' do
          expect(list_item.reload.name).not_to be_empty
        end

        it 'is expected to render edit template' do
          expect(response).to render_template(:edit)
        end

        it 'is expected to add errors to list_item name attribute' do
          expect(assigns[:list_item].errors[:name]).to eq(['can\'t be blank'])
        end
      end
    end
  end

end
