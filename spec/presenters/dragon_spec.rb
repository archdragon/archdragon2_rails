require_relative '../light_helper'

describe DragonPresenter do
  let(:dragon) { Dragon.new(user: User.new) }
  describe '#image' do
    it 'returns a path to the image' do
      @dragon_presenter = ArchPresenter::Base.present(dragon)
      expect(@dragon_presenter.image).to be_kind_of(String)
    end
    it 'depends on the dragon\'s stage of life' do
      young_dragon = Dragon.new(user: User.new)
      old_dragon   = Dragon.new(user: User.new)

      allow(young_dragon).to receive(:growth_stage) { Dragon::STAGE_YOUNG }
      allow(old_dragon).to receive(:growth_stage) { Dragon::STAGE_OLD }

      young_dragon_presenter = ArchPresenter::Base.present(young_dragon)
      old_dragon_presenter   = ArchPresenter::Base.present(old_dragon)

      expect(young_dragon_presenter.image).not_to eq(old_dragon_presenter.image)
    end
    it 'depends on the dragon\'s element' do
    end
  end
end
