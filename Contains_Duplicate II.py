# class Solution:
#     def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
#         seen = {}
#
#         for i, val in enumerate(nums):
#             if val in seen and i - seen[val] <= k:
#                 return True
#             else:
#                 seen[val] = i
#
#         return False

#Sliding Window Method

class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        window = set()
        L = 0

        for r in range(len(nums)):
            if r - L > k:
                window.remove(nums[L])
                L += 1
            if nums[r] in window:
                return True
            else:
                window.add(nums[r])
        return False
