require_relative '../light_helper'

describe DragonPresenter do

  describe '#image' do
    it 'returns a path to the image' do
      dragon = build(:dragon)
      dragon_presenter = ArchPresenter::Base.present(dragon)
      expect(dragon_presenter.image).to be_kind_of(String)
    end
    it 'changes with the dragon\'s stage of life' do
      young_dragon = build(:dragon)
      old_dragon   = build(:dragon)

      allow(young_dragon).to receive(:growth_stage) { Dragon::STAGE_YOUNG }
      allow(old_dragon).to receive(:growth_stage) { Dragon::STAGE_OLD }

      young_dragon_presenter = ArchPresenter::Base.present(young_dragon)
      old_dragon_presenter   = ArchPresenter::Base.present(old_dragon)

      expect(young_dragon_presenter.image).not_to eq(old_dragon_presenter.image)
    end
    it 'changes with the dragon\'s element' do
      dragon, different_dragon = build(:dragon), build(:dragon)

      allow(dragon).to receive(:element) { Dragon::ELEMENT_WATER }
      allow(different_dragon).to receive(:element) { Dragon::ELEMENT_FIRE }

      dragon_presenter = ArchPresenter::Base.present(dragon)
      different_dragon_presenter = ArchPresenter::Base.present(different_dragon)

      expect(dragon_presenter.image).not_to eq(different_dragon_presenter.image)
    end
  end

  describe '#feeding_countdown_value' do
    context 'if the dragon didn\'t eat today' do 
      it 'returns 0' do
        hungry_dragon = build(:dragon)

        allow(hungry_dragon).to receive(:feeding_time) { FeedingTime.yesterday }

        hungry_dragon = ArchPresenter::Base.present(hungry_dragon)

        expect(hungry_dragon.feeding_countdown_value).to eq(0)
      end
    end
    context 'if the dragon ate something today' do
      it 'returns a number of seconds to midnight' do
        dragon = build(:dragon)

        allow(dragon).to receive(:feeding_time) { FeedingTime.today }
        dragon = ArchPresenter::Base.present(dragon)

        expect(dragon.feeding_countdown_value).to be > 0
      end
    end
  end
end
