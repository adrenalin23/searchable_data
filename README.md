Objective:<br/>
  Make data provided in data.json searchable

Requirements:<br/>
• search logic should be implemented in pure ruby (without frameworks)<br/>
• search match precision (full words matching)<br/>
• search for `Lisp Common` should match a programming language named "Common Lisp"<br/>
• support for exact matches, eg. `Interpreted "Thomas Eugene"`, which should match "BASIC", but not "Haskell"<br/>
• match in different fields, eg. `Scripting Microsoft` should return all scripting languages designed by "Microsoft"<br/>
• solution elegance<br/>
• writing code with reusability and extendability/extensibility in mind.<br/>

Usage:<br/>
ruby main.rb Lisp Common<br/>
ruby main.rb Interpreted "Thomas Eugene"<br/>
ruby main.rb Interpreted "Eugene Thomas"<br/>
ruby main.rb Scripting Microsoft<br/>
ruby main.rb Microsoft Scripting
