import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const ErrorCard({
    super.key,
    required this.title,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: screenWidth * 0.8,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.red.shade100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 48,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade800,
                  )
                ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red.shade700,
                  )
                ),
                const SizedBox(height: 16),
                if (onRetry != null)
                  ElevatedButton(
                    onPressed: onRetry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white
                    ),
                    child: const Text('Tentar novamente'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
