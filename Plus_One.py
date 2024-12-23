class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        for i in range(len(digits) - 1, -1, -1):
            if digits[i] < 9:
                # If current digit is less than 9, we just add 1 and return
                digits[i] += 1
                return digits
            # If digit is 9, set it to 0 and move to the next left
            digits[i] = 0

        # If all the digits are 9, we need to add an additional 1 at the start
        return [1] + digits