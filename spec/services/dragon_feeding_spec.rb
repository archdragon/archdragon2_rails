require_relative '../../lib/arch_response/arch_response'
require_relative '../../app/services/feed_dragon_service'

ChangeItemCountService = Class.new

describe FeedDragonService do
  it 'removes the item' do
    expect(ChangeItemCountService).to receive(:call!) { ArchResponse::Success.new }
  end
  it 'changes dragon\'s hunger' do
  end
end

