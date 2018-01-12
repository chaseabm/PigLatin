public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  for (int i = 0; i < sWord.length() - 1; i++) {
    if (sWord.charAt(i) == 'a' || sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o' || sWord.charAt(i) == 'u' || sWord.charAt(i) == 'e') {
      return i;
    }
  }
  return -1;
}
public boolean startsWithQu(String sWord)
{
	if (sWord.length() >= 2)
	{
		if (sWord.charAt(0) == 'q' && sWord.charAt(1) == 'u')
		{
			return true;
		}
	}
	return false;
}

public String startsWithConsonant(String sWord)
{
	int i = findFirstVowel(sWord);
	String fWord = sWord.substring(i, sWord.length());
	for (int j = 0; j < i; j++) {
		fWord += sWord.charAt(j);
	}
	fWord += "ay";
	return fWord;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1) // if its all consonants
	{
		return sWord + "ay";
	}
	else if (findFirstVowel(sWord) == 0) // if it starts with a vowel
	{
		return sWord + "way";
	} 
	else if (startsWithQu(sWord) == true)  // starts with qu
	{
		return sWord.substring(2, sWord.length()) + "quay";
	}
	else if (findFirstVowel(sWord) > 0) // starts with consonant
	{
		return startsWithConsonant(sWord);
	}
	else
	{
		return "ERROR!";
	}
}

//note: doesn't consider if starts with "th" or "st" sound and it's apparently supposed to :(
//use loop to check where first vowel is, check that it's not all vowels, insert letters up to that at end