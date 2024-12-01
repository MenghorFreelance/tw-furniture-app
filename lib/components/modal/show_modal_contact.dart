import 'package:flutter/material.dart';
import 'package:flutter_tem/utils/image/app_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';

void showCustomBottomModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor:
        Colors.transparent, // Transparent background for custom styling
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.56, // Start with half the screen height
        minChildSize: 0.4, // Minimum height the modal can be dragged to
        maxChildSize: 0.9, // Maximum height the modal can be dragged to
        builder: (BuildContext context, ScrollController scrollController) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
              ),
              color: Colors.blueGrey[50], // Background color of the modal
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller:
                          scrollController, // Allows scrolling within the sheet
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.close,
                                size: 24,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Custom Modal Content',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Contact store via call or chat (Telegram/Messenger).',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.black.withOpacity(
                              0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(
                          color: AppColors.lineGrey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.black.withOpacity(
                              0.5,
                            ),
                          ),
                        ),
                        const Text(
                          'Street 1938, Sensok, Phnom Penh',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.black.withOpacity(
                              0.5,
                            ),
                          ),
                        ),
                        const Text(
                          'Street 1938, Sensok, Phnom Penh',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.black.withOpacity(
                              0.5,
                            ),
                          ),
                        ),
                        const Text(
                          'Street 1938, Sensok, Phnom Penh',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.black.withOpacity(
                              0.5,
                            ),
                          ),
                        ),
                        const Text(
                          'Street 1938, Sensok, Phnom Penh',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: AppColors.customGradient,
                            borderRadius: BorderRadiusDirectional.circular(4),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                color: AppColors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Call to store',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: AppColors.customGradient,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(4),
                                  color: AppColors.black.withOpacity(
                                    0.05,
                                  ),
                                  border: Border.all(
                                    color: AppColors.black.withOpacity(
                                      0.15,
                                    ), // Border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImage.chat,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Telegram',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: AppColors.customGradient,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(4),
                                  color: AppColors.black.withOpacity(
                                    0.05,
                                  ),
                                  border: Border.all(
                                    color: AppColors.black.withOpacity(
                                      0.15,
                                    ), // Border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImage.chat,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Messenger',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
