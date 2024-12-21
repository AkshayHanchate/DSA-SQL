class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        b = prices[0]
        profit = 0

        for i in prices[1:]:
            if b > i:
                b = i

            profit = max(profit, i - b)

        return profit
