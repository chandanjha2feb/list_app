require 'rails_helper'

RSpec.describe listsController, type: :controller do

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

    it 'is expected to assign user instance variable' do
      expect(assigns[:lists]).to eq(List.all)
    end
  end

  # new action
  describe 'GET #new' do
    before do
      get :new
    end

    it 'is expected to assign user as new instance variable' do
      expect(assigns[:list]).to be_instance_of(List)
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
       let(:params) { { list: { name: "kolkata" } } }

       it 'is expected to create new user successfully' do
         expect(assigns[:list]).to be_instance_of(list)
       end

       it 'is expected to have name assigned to it' do
         expect(assigns[:list].name).to eq('kolkata')
       end

       it 'is expected to redirect to lists path' do
         is_expected.to redirect_to lists_path
       end
     end

       it 'is expected to add errors to name attribute' do
         expect(assigns[:list].errors[:name]).to eq(['can\'t be blank'])
       end
   end

   # update action
  describe 'PATCH #update' do

    before do
      # something that you want to execute before running `it` block
      patch :update, params: params
    end

    context 'when list not found' do
      let(:params) { { id: Faker::Number.number } }

      it 'is expected to redirect_to lists path' do
        is_expected.to redirect_to(lists_path)
      end

      it 'is expected to set flash' do
        expect(flash[:notice]).to eq('User not found.')
      end
    end

    context 'when list exist in database' do
      let(:list) { FactoryBot.create :list }
      let(:params) { { id: list.id, list: { name: 'test name' } } }

      context 'when data is provided is valid' do
        it 'is expected to update list' do
          expect(list.reload.name).to eq('test name')
        end

        it 'is_expected to redirect_to lists_path' do
          is_expected.to redirect_to(lists_path)
        end

      end

      context 'when data is invalid' do
        let(:list) { FactoryBot.create :list }
        let(:params) { { id: list.id, list: { name: '' } } }

        it 'is expected not to update list name' do
          expect(list.reload.name).not_to be_empty
        end

        it 'is expected to render edit template' do
          expect(response).to render_template(:edit)
        end

        it 'is expected to add errors to list name attribute' do
          expect(assigns[:list].errors[:name]).to eq(['can\'t be blank'])
        end
      end
    end
  end

end
