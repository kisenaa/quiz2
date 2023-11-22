<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weather Data</title>
    <!-- Add any necessary CSS links here -->
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Weather Data</h2>
        </div>
        <div class="content">
            <c:if test="${isLoading}">
                <span>Loading weather data. Please wait ....</span>
            </c:if>

            <c:if test="${!isLoading}">
                <div class="location">
                    <div class="location-info">
                        <span class="map-marker">&#x1F4CD;</span>
                        ${weatherData.name}, Indonesia
                    </div>
                </div>

                <div class="weather-info">
                    <div class="weather-icon">
                        <!-- You will need to map the weather icon to JSP equivalent -->
                        <!-- Example: <img src="<%= getWeatherIcon(weatherData.weather[0].main) %>" alt="Weather Icon" /> -->
                    </div>
                    <div class="weather-description">
                        <p class="font-bold">${weatherData.weather[0].main}</p>
                    </div>
                </div>

                <div class="temperature-info">
                    <div class="temperature">
                        <p class="temperature-label">Temp</p>
                        <h3 class="temperature-value">${Math.round(weatherData.main.temp)}°C</h3>
                        <span class="temperature-text" style="background-color: ${temperatureColor}; color: white; font-size: 15px;">
                            ${temperatureText}
                        </span>
                    </div>
                </div>

                <!-- Add other weather details here -->

            </c:if>
        </div>
    </div>
</body>
</html>
