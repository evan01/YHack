import math
#diffNorth difference of angle between the direction the person's phone is facing compared to north
#Has to be in radians
def direction(person1X,person1Y, person2X,person2Y, diffNorth):
	distanceX = person2X - person1X
	distanceY =  person2Y - person2Y
	hypothenuse = math.sqrt(distanceX ** 2 + distanceY ** 2)
	angle = math.asin(distancX/hypothenuse)
	angleToPerson = (diffNorth+angle)%(2*math.pi)
	return angleToPerson