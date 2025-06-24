import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/address_params.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/features/address/domain/entities/address_entity.dart';
import 'package:tsh_soft/features/address/presentation/cubit/delete_address_cubit/delete_address_cubit.dart';
import 'package:tsh_soft/features/address/presentation/cubit/get_address_cubit/get_address_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  void initState() {
    BlocProvider.of<GetAddressesCubit>(context).getAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, Routes.addAddressesRoute).then((value) {
            if (value == true) {
              BlocProvider.of<GetAddressesCubit>(context).getAddresses();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('delivery_addresses'.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetAddressesCubit, GetAddressesState>(
          builder: (context, state) {
            if (state is GetAddressesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAddressesFailureState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is GetAddressesSuccessState) {
              final List<AddressEntity> addresses =
                  state.resp.data as List<AddressEntity>;
              if (addresses.isEmpty) {
                return Center(
                    child: Text(
                  'no_address'.tr(context),
                  style: TextStyles.regular16(),
                ));
              }
              return ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final AddressEntity address = addresses[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      trailing:
                          BlocListener<DeleteAddressCubit, DeleteAddressState>(
                        listener: (context, state) {
                          if (state is DeleteLocationLoadingState) {
                            Constants.showLoading(context);
                          } else if (state is DeleteLocationFailureState) {
                            Constants.hideLoading(context);
                            Constants.showSnakToast(
                                context: context,
                                message: state.errorMessage,
                                type: 3);
                          } else if (state is DeleteLocationSuccessState) {
                            Constants.hideLoading(context);
                            Constants.showSnakToast(
                                context: context,
                                message: state.resp.message,
                                type: 1);
                            BlocProvider.of<GetAddressesCubit>(context)
                                .getAddresses();
                          }
                        },
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<DeleteAddressCubit>(context)
                                .deleteLocation(
                                    AddressParams(id: address.id.toString()));
                          },
                          child: SvgPicture.asset(SvgAssets.delete,
                              height: 25.h,
                              colorFilter: Constants.colorFilter(
                                context.colors.errorColor,
                              )),
                        ),
                      ),
                      leading: SvgPicture.asset(SvgAssets.iconLocation,
                          height: 25.h,
                          colorFilter: Constants.colorFilter(
                            context.colors.main,
                          )),
                      iconColor: context.colors.main,
                      title: Text(
                        address.title ?? '',
                        style: TextStyles.semiBold16(),
                      ),
                      subtitle: Text(
                          "${address.city ?? ''}, ${address.area ?? ''}, ${address.details ?? ''}"),
                      visualDensity: VisualDensity.compact,
                      minVerticalPadding: 20,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(
                            color: Colors.grey,
                          )),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
