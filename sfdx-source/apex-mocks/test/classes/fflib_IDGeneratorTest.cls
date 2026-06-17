/**
 * Copyright (c) 2014, FinancialForce.com, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 * - Neither the name of the FinancialForce.com, inc nor the names of its contributors
 *      may be used to endorse or promote products derived from this software without
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
@isTest
@SuppressWarnings('PMD.ClassNamingConventions')
private class fflib_IDGeneratorTest
{
	@isTest
	static void itShouldGenerateValidIDs()
	{
		String accountPrefix = Account.SObjectType.getDescribe(SObjectDescribeOptions.DEFERRED).getKeyPrefix();

		String id1 = fflib_IDGenerator.generate(Account.SObjectType);
		String id2 = fflib_IDGenerator.generate(Account.SObjectType);
		String id3 = fflib_IDGenerator.generate(Account.SObjectType);
		String id4 = fflib_IDGenerator.generate(Account.SObjectType);
		String id5 = fflib_IDGenerator.generate(Account.SObjectType);
		String id6 = fflib_IDGenerator.generate(Account.SObjectType);
		String id7 = fflib_IDGenerator.generate(Account.SObjectType);
		String id8 = fflib_IDGenerator.generate(Account.SObjectType);
		String id9 = fflib_IDGenerator.generate(Account.SObjectType);
		String id10 = fflib_IDGenerator.generate(Account.SObjectType);
		String id11 = fflib_IDGenerator.generate(Account.SObjectType);

		for (String generatedId : new List<String>{ id1, id2, id3, id4, id5, id6, id7, id8, id9, id10, id11 })
		{
			System.Assert.areEqual(18, generatedId.length(), 'Generated ID should be 18 characters');
			System.Assert.isTrue(generatedId.startsWith(accountPrefix), 'Generated ID should start with Account key prefix');
		}

		Set<String> uniqueIds = new Set<String>{ id1, id2, id3, id4, id5, id6, id7, id8, id9, id10, id11 };
		System.Assert.areEqual(11, uniqueIds.size(), 'All generated IDs should be unique');
	}
}