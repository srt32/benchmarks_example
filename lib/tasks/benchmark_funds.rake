desc 'Benchmark funds_raised methods'

ITERATIONS = 1000

task benchmark_sql: :environment do
  campaign = Campaign.last

  Benchmark.bm do |bm|
    bm.report('sql') do
      ITERATIONS.times do
        Campaign.uncached do
          campaign.funds_raised_sql
          campaign.reload
        end
      end
    end
  end
end


task benchmark_ruby: :environment do
  campaign = Campaign.last

  Benchmark.bm do |bm|
    bm.report('ruby') do
      ITERATIONS.times do
        Campaign.uncached do
          campaign.funds_raised_ruby
          campaign.reload
        end
      end
    end
  end
end


## Sample results for 1000 iterations
#
#        user     system      total        real
#   ruby 17.660000   1.330000  18.990000 ( 20.545473)
#   sql  0.690000   0.070000   0.760000 (  1.045379)
