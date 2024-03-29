# Description

In this assignment, we want you to implement a simple mobile app that allows users to search for Star Wars resources (characters and starships) and save them to favourites. Use https://swapi.dev/ to retrieve data.

-   The app must have at least 2 pages/views:
-   Homepage: users can search for characters and starships and mark them as favourites.    
-   Favourites page: characters and starships marked as favourites are displayed.    
-   Display movies in which favourite characters and starships appear on the favourites page.  
# Application Content
-   On the home page, display an input element that allows the user to search for characters, starships and planets by "name" and the API call should only be initiated after the user enters at least 2 characters.    
-   The search page and favourites should display:
	- for Star Wars characters: 
		- name, 
		- gender
		- number of starships this person has piloted
	- for starships: 
		- name, 
		- model, 
		- manufacturer, 
		- passengers
	- for planets:
		- name, 
		- diameter, 
		- population count    
-   The favourites page should show the following for movies:
	- title, 
	- director
	- producer
-   Favourites, should be persistent (stored between application launches).
