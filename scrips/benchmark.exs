sample_data = 1..100000
|> Enum.map fn(n) -> round(:random.uniform * 1000) end

MergeSortParallel.sort sample_data
