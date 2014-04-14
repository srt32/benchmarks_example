desc 'Benchmark funds_raised methods'

ITERATIONS = 100_000

task benchmark_sql: :environment do
  GC.disable
  campaign = Campaign.last

  Benchmark.bm do |bm|
    bm.report('sql') do
      ITERATIONS.times do
        Campaign.uncached do
          campaign.funds_raised_sql
          Campaign.connection.clear_query_cache
        end
      end
    end
  end
  GC.enable
end


task benchmark_ruby: :environment do
  GC.disable
  campaign = Campaign.last

  Benchmark.bm do |bm|
    bm.report('ruby') do
      ITERATIONS.times do
        Campaign.uncached do
          campaign.funds_raised_ruby
          Campaign.connection.clear_query_cache
        end
      end
    end
  end
  GC.enable
end
