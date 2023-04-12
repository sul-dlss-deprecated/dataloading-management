require "rails_helper"

RSpec.describe DataloadJobsService do
  context "when there are jobs ready to schedule" do
    let!(:job1) { create(:dataload_job, :recurs_daily_yesterday) }
    let!(:job2) { create(:dataload_job, :recurs_daily_yesterday) }
    let!(:job3) { create(:dataload_job, :recurs_daily_tomorrow) }

    it "retreives and queues the jobs" do
      expect(described_class.fetch.count).to eq 2
      job1.reload
      job2.reload
      job3.reload
      expect(job1.status).to eq "queued"
      expect(job2.status).to eq "queued"
      expect(job3.status).to eq "scheduled"
    end
  end

  context "when there are no jobs ready to schedule" do
    let!(:job1) { create(:dataload_job, :recurs_daily_tomorrow) }
    let!(:job2) { create(:dataload_job, :recurs_daily_tomorrow) }
    let!(:job3) { create(:dataload_job, :recurs_daily_tomorrow) }

    it "retreives and queues the jobs" do
      expect(described_class.fetch.count).to eq 0
      expect(job1.status).to eq "scheduled"
      expect(job2.status).to eq "scheduled"
      expect(job3.status).to eq "scheduled"
    end
  end
end
