import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statedemo/presentation/cubits/weather_cubit/weather_cubit.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeather(city: 'Mangaluru');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          final weatherRes = state.weather;
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${weatherRes.current.tempC}°C',
                style: Theme.of(context).textTheme.regularSemiBold.apply(
                      color: Colors.white,
                    ),
              ),
              Text(
                '${weatherRes.location.name}, ${weatherRes.location.region.substring(0, 3)}',
                style: Theme.of(context).textTheme.regularSmall.apply(
                      color: Colors.white,
                    ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
