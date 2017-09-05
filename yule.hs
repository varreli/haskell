<hexagoxel>	@let returnAfterApply f a c = f a
<lambdabot>	 Defined.
<hexagoxel>	> returnAfterApply not True "whatever"
<lambdabot>	 False
*	nickolay_ has quit (Remote host closed the connection)
<hexagoxel>	(it is also the same as (.) const, if that helps..)
<hexagoxel>	:t [(.) const, returnAfterApply]
<lambdabot>	[(a1 -> a) -> a1 -> b -> a]
<crucify_me>	hexagoxel, thanks, hold on yeah that is helpful if it is related to const
*	Guest887 has quit (Remote host closed the connection)
<crucify_me>	the keyword not is used as an argument there hexagoxel ?
<hexagoxel>	not a keyword :)
<hexagoxel>	:t not
<lambdabot>	Bool -> Bool
<hexagoxel>	otherwise, yes
