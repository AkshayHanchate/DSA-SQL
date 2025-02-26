#
# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
#
# An input string is valid if:
#
# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Every close bracket has a corresponding open bracket of the same type.
#


# Example 1:
#
# Input: s = "()"
#
# Output: true
#
# Example 2:
#
# Input: s = "()[]{}"
#
# Output: true


class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        mapping = {"}":"{",")":"(","]":"["}

        for c in s:
            if c in mapping.values():
                stack.append(c)
            elif c in mapping.keys():
                if not stack or mapping[c]!= stack.pop():
                    return False

        return not stack