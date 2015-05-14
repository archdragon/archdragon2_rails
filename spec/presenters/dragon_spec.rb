require_relative '../light_helper'

describe DragonPresenter do
  let(:dragon) { Dragon.new(user: User.new) }

  describe '#image' do
    it 'returns a path to the image' do
      @dragon_presenter = ArchPresenter::Base.present(dragon)
      expect(@dragon_presenter.image).to be_kind_of(String)
    end
    it 'changes with the dragon\'s stage of life' do
      young_dragon = dragon.clone
      old_dragon   = dragon.clone

      allow(young_dragon).to receive(:growth_stage) { Dragon::STAGE_YOUNG }
      allow(old_dragon).to receive(:growth_stage) { Dragon::STAGE_OLD }

      young_dragon_presenter = ArchPresenter::Base.present(young_dragon)
      old_dragon_presenter   = ArchPresenter::Base.present(old_dragon)

      expect(young_dragon_presenter.image).not_to eq(old_dragon_presenter.image)
    end
    it 'changes with the dragon\'s element' do
      different_dragon = dragon.clone

      allow(dragon).to receive(:element) { Dragon::ELEMENT_WATER }
      allow(different_dragon).to receive(:element) { Dragon::ELEMENT_FIRE }

      dragon_presenter = ArchPresenter::Base.present(dragon)
      different_dragon_presenter = ArchPresenter::Base.present(different_dragon)

      expect(dragon_presenter.image).not_to eq(different_dragon_presenter.image)
    end
  end
end
