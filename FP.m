%Deriek Thomas and John Vohs
%approved by Laurel Hilger
function [] = FP()
global raffle;
raffle.money = 0;
raffle.tickets = 0;

%figure -- add tickets and edit money total goal
raffle.fig = figure('numbertitle', 'off', 'name', 'Randomized Raffle Winner Selector'); %gives a window and a title
%raffle ticket / price 
raffle.dollarGain = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.30 .8 .4 .1], 'string', '1 ticket for $5', 'callback',{@overall,5,1});
raffle.dollarGain = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.30 .7 .4 .1], 'string', '5 tickets for $20', 'callback',{@overall,20,5});
raffle.dollarGain = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.30 .6 .4 .1], 'string', '10 tickets for $35', 'callback',{@overall,35,10});
raffle.dollarGain = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.30 .5 .4 .1], 'string', '100 tickets for $200', 'callback',{@overall,200,100});
%displays money earned and tickets bought
raffle.moneyDisplayMessage = uicontrol('style', 'text', 'units', 'normalized', 'position', [.35 .4 .09 .095], 'string', 'Money Earned:', 'horizontalalignment', 'center');
raffle.moneyDisplay = uicontrol('style', 'text', 'units', 'normalized', 'position',[.35 .35 .09 .05], 'string', num2str(raffle.money), 'horizontalalignment', 'center');
raffle.ticketsDisplayMessage = uicontrol('style', 'text', 'units', 'normalized', 'position', [.55 .4 .09 .095], 'string', 'Total Tickets:', 'horizontalalignment', 'center');
raffle.ticketsDisplay = uicontrol('style', 'text', 'units', 'normalized', 'position',[.55 .35 .09 .05], 'string', num2str(raffle.tickets), 'horizontalalignment', 'center');
raffle.goal = uicontrol('style', 'text', 'units', 'normalized', 'position', [.35 .2 .09 .095], 'string', 'Goal of:', 'horizontalalignment', 'center');
raffle.goal = uicontrol('style', 'edit', 'units', 'normalized', 'position', [.435 .225 .12 .095], 'horizontalalignment', 'center');
raffle.goal = uicontrol('style', 'popupmenu', 'units', 'normalized', 'position', [.55 .2 .15 .095], 'horizontalalignment', 'center','string',{'Dollars','Tickets'});

%raffle winner
raffle.raffleWinner = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[0 .1 1 .1], 'string', 'Randomly Select Winner', 'callback', {@chickenDinner});

function [] = overall(source, event, cash, ticket)
raffle.money = raffle.money + cash; %money being earned
raffle.tickets = raffle.tickets + ticket; %tickets being added
raffle.moneyDisplay.String = num2str(raffle.money); %money earned in total
raffle.ticketsDisplay.String = num2str(raffle.tickets); %tickets in total for first figure
end

function [] = chickenDinner(source, event)
    if ((raffle.tickets) > 0)
        w = randi(raffle.tickets);
        str = num2str(w);
        winnerMsg = ['THE WINNER IS NUMBER... ', str];
        msgbox(winnerMsg,'WINNER!','modal');
    else
        msgbox('insufficient amount of tickets sold -- no tickets sold yet', 'modal');
    end
end

end