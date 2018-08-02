#!/usr/bin/python

"""
gencc: A simple program to generate credit card numbers that pass the
MOD 10 check (Luhn formula).
Usefull for testing e-commerce sites during development.

Copyright 2003-2012 Graham King

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
"""

# Different naming convention, because translated from PHP
# pylint: disable=C0103

from random import Random
import copy

visaPrefixList = [
        ['4', '5', '3', '9'],
        ['4', '5', '5', '6'],
        ['4', '9', '1', '6'],
        ['4', '5', '3', '2'],
        ['4', '9', '2', '9'],
        ['4', '0', '2', '4', '0', '0', '7', '1'],
        ['4', '4', '8', '6'],
        ['4', '7', '1', '6'],
        ['4']]

mastercardPrefixList = [
        ['5', '1'],
        ['5', '2'],
        ['5', '3'],
        ['5', '4'],
]

amexPrefixList = [['3', '4'], ['3', '7']]

discoverPrefixList = [['6', '0', '1', '1']]

dinersPrefixList = [
        ['3', '0', '0'],
        ['3', '0', '1'],
        ['3', '0', '2'],
        ['3', '0', '3'],
        ['3', '6'],
        ['3', '8']]

enRoutePrefixList = [['2', '0', '1', '4'], ['2', '1', '4', '9']]

jcbPrefixList = [['3', '5']]

voyagerPrefixList = [['8', '6', '9', '9']]


def completed_number(prefix, length):
    """
    'prefix' is the start of the CC number as a string, any number of digits.
    'length' is the length of the CC number to generate. Typically 13 or 16
    """

    ccnumber = prefix

    # generate digits

    while len(ccnumber) < (length - 1):
        digit = str(generator.choice(range(0, 10)))
        ccnumber.append(digit)

    # Calculate sum

    sum = 0
    pos = 0

    reversedCCnumber = []
    reversedCCnumber.extend(ccnumber)
    reversedCCnumber.reverse()

    while pos < length - 1:

        odd = int(reversedCCnumber[pos]) * 2
        if odd > 9:
            odd -= 9

        sum += odd

        if pos != (length - 2):

            sum += int(reversedCCnumber[pos + 1])

        pos += 2

    # Calculate check digit

    checkdigit = ((sum / 10 + 1) * 10 - sum) % 10

    ccnumber.append(str(checkdigit))

    return ''.join(ccnumber)


def credit_card_number(rnd, prefixList, length, howMany):

    result = []

    while len(result) < howMany:

        ccnumber = copy.copy(rnd.choice(prefixList))
        result.append(completed_number(ccnumber, length))

    return result


def output(title, numbers):

    result = []
    result.append(title)
    result.append('-' * len(title))
    result.append('\n'.join(numbers))
    result.append('')

    return '\n'.join(result)

#
# Main
#

generator = Random()
generator.seed()        # Seed from current time

print("darkcoding credit card generator\n")

from pwn import *

io = remote("10.67.0.1", 31734)

def genCardLast(brand, last): # Last is only used for test requiring specified last digits
    card = ""
    luhn = 0
    cardLength = 15
    final = last % 10
    if brand == 'd': #Discover IIN (Issuer Identification Number)
        nums = [6,0,1,1]
    elif brand == 'm': #MasterCard IIN
        nums = [5,3,0,1,1,1]
    elif brand == 'v': #Visa IIN
        nums = [4,0,4,6,4,5]
    elif brand == 'a': #American Express IIN
        nums = [3,7,4,3,1,4]
        cardLength = 14 #American Express cards are 15 digits
    else:
        nums = [int(x) for x in str(brand)] #When first numbers are specified
    while len(nums) < cardLength: #Adds random numbers after IIN
        nums.append(random.randint(0,9))
    print(last)
    if last != 0: #Sets last 3 non-check digits to specified numbers
        nums[14] = (last // 10) % 10
        nums[13] = (last // 100) % 10
        nums[12] = (last // 1000)
    cardLength -= 1
    cv = copy.deepcopy(nums)
    while cardLength > -1: #Luhn's Algorithm
        nums[cardLength] = 2 * nums[cardLength]
        if nums[cardLength] >= 10:
            nums[cardLength] -= 9
        cardLength -= 2
    for digit in cv:
        card += str(digit)
    for digit in nums:
        luhn += digit
    luhn = luhn % 10 #setting check digit
    luhn = 10 - luhn
    if luhn == 10:
        luhn = 0
    card += str(luhn)
    return card

def checkLuhn(cardIn): #Only used for checking generated numbers. Somewhat buggy - I think it fails on 15-digit numbers, but it worked consistently enough to get the flag after a few tries

    luhn = 0
    nums = [int(x) for x in str(cardIn)] # Due to the way numbers are retrieved from the string, the last two are the options 1 and 0, and must be removed
    del nums[-1]
    del nums[-1]
    cardLength = len(nums);
    i = cardLength - 2 #otherwise, run Luhn's as above
    while i > -1:
        nums[i] = 2 * nums[i]
        if nums[i] >= 10:
            nums[i] -= 9
        i -= 2
    print(nums)
    for digit in nums:
        luhn += digit
    print(luhn)
    if luhn  % 10 == 0: #Adding the check digit should result in a multiple of ten
        return 1
    else:
        return 0


while True:
    line = io.recvline()

    print (line)
    cc = None
    if "MasterCard" in line:
        cc = credit_card_number(generator, mastercardPrefixList, 16, 1)
    elif "American Express" in line:
        cc = credit_card_number(generator, amexPrefixList, 15, 1)
    elif "Visa" in line:
        cc = credit_card_number(generator, visaPrefixList, 16, 1)
    elif "Discover" in line:
        cc = credit_card_number(generator, discoverPrefixList, 16, 1)
    elif "I need a new card that starts with" in line:
        prefix = line[len("I need a new card that starts with "):len("I need a new card that starts with ") + 4]
        prefix = [list(prefix)]
        print (prefix)
        cc = credit_card_number(generator, prefix, 16, 1)
    elif "I need a new card which ends with" in line:
        sufix = line[len("I need a new card which ends with "):-2]
        sufix = int(sufix)

        cc = "-----------"
        while cc[-1] != str(sufix % 10):
            cc = genCardLast("v", sufix)

        print (cc)
        cc = [cc]
        print (sufix)
    elif "is valid" in line:
        print (int(filter(str.isdigit, line)))
        cc = checkLuhn(int(filter(str.isdigit, line)))
        cc = [str(cc)]
    else:
        print (line)
        break
    if cc:
        print (''.join(cc))
        io.sendline(''.join(cc))
        io.recvuntil('Thanks!')
        io.recvline()

io.interactive()
