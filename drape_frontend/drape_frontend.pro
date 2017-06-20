TARGET = drape_frontend
TEMPLATE = lib
CONFIG += staticlib

SHADER_COMPILE_ARGS = $$PWD/shaders shader_index.txt shaders_lib.glsl $$PWD shader_def
CMDRES = $$system(python $$PWD/../tools/autobuild/shader_preprocessor.py $$SHADER_COMPILE_ARGS)
!isEmpty($$CMDRES):message($$CMDRES)

ROOT_DIR = ..
include($$ROOT_DIR/common.pri)

INCLUDEPATH *= $$ROOT_DIR/3party/protobuf/protobuf/src
INCLUDEPATH *= $$ROOT_DIR/3party/expat/lib
INCLUDEPATH *= $$ROOT_DIR/3party/freetype/include

SOURCES += \
    animation/animation.cpp \
    animation/arrow_animation.cpp \
    animation/base_interpolator.cpp \
    animation/follow_animation.cpp \
    animation/interpolation_holder.cpp \
    animation/interpolations.cpp \
    animation/interpolators.cpp \
    animation/linear_animation.cpp \
    animation/scale_animation.cpp \
    animation/sequence_animation.cpp \
    animation/parallel_animation.cpp \
    animation/opacity_animation.cpp \
    animation/show_hide_animation.cpp \
    gui/choose_position_mark.cpp \
    gui/compass.cpp \
    gui/copyright_label.cpp \
    gui/debug_label.cpp \
    gui/drape_gui.cpp \
    gui/gui_text.cpp \
    gui/layer_render.cpp \
    gui/ruler.cpp \
    gui/ruler_helper.cpp \
    gui/shape.cpp \
    gui/skin.cpp \
    gui/subway_label_helper.cpp \
    animation_system.cpp \
    animation_utils.cpp \
    apply_feature_functors.cpp \
    area_shape.cpp \
    arrow3d.cpp \
    backend_renderer.cpp \
    base_renderer.cpp \
    batch_merge_helper.cpp \
    circles_pack_shape.cpp \
    color_constants.cpp \
    colored_symbol_shape.cpp \
    drape_api.cpp \
    drape_api_builder.cpp \
    drape_api_renderer.cpp \
    drape_engine.cpp \
    drape_measurer.cpp \
    engine_context.cpp \
    frontend_renderer.cpp \
    gps_track_renderer.cpp \
    line_shape.cpp \
    line_shape_helper.cpp \
    map_data_provider.cpp \
    message_acceptor.cpp \
    message_queue.cpp \
    metaline_manager.cpp \
    my_position.cpp \
    my_position_controller.cpp \
    navigator.cpp \
    overlay_batcher.cpp \
    overlays_tracker.cpp \
    path_symbol_shape.cpp \
    path_text_handle.cpp \
    path_text_shape.cpp \
    poi_symbol_shape.cpp \
    postprocess_renderer.cpp \
    read_manager.cpp \
    read_metaline_task.cpp \
    read_mwm_task.cpp \
    render_group.cpp \
    render_node.cpp \
    render_state.cpp \
    requested_tiles.cpp \
    route_builder.cpp \
    route_renderer.cpp \
    route_shape.cpp \
    rule_drawer.cpp \
    scenario_manager.cpp \
    screen_animations.cpp \
    screen_operations.cpp \
    screen_quad_renderer.cpp \
    selection_shape.cpp \
    shader_def.cpp \
    stylist.cpp \
    text_handle.cpp \
    text_layout.cpp \
    text_shape.cpp \
    threads_commutator.cpp \
    tile_info.cpp \
    tile_key.cpp \
    tile_utils.cpp \
    traffic_generator.cpp \
    traffic_renderer.cpp \
    user_event_stream.cpp \
    user_mark_generator.cpp \
    user_mark_shapes.cpp \
    user_marks_provider.cpp \
    visual_params.cpp \
    kinetic_scroller.cpp \

HEADERS += \
    animation/animation.hpp \
    animation/arrow_animation.hpp \
    animation/base_interpolator.hpp \
    animation/follow_animation.hpp \
    animation/interpolation_holder.hpp \
    animation/interpolations.hpp \
    animation/interpolators.hpp \
    animation/linear_animation.hpp \
    animation/scale_animation.hpp \
    animation/sequence_animation.hpp \
    animation/parallel_animation.hpp \
    animation/opacity_animation.hpp \
    animation/show_hide_animation.hpp \
    animation/value_mapping.hpp \
    gui/choose_position_mark.hpp \
    gui/compass.hpp \
    gui/copyright_label.hpp \
    gui/debug_label.hpp \
    gui/drape_gui.hpp \
    gui/gui_text.hpp \
    gui/layer_render.hpp \
    gui/ruler.hpp \
    gui/ruler_helper.hpp \
    gui/shape.hpp \
    gui/skin.hpp \
    gui/subway_label_helper.hpp \
    animation_constants.hpp \
    animation_system.hpp \
    animation_utils.hpp \
    apply_feature_functors.hpp \
    area_shape.hpp \
    arrow3d.hpp \
    backend_renderer.hpp \
    base_renderer.hpp \
    batchers_pool.hpp \
    batch_merge_helper.hpp \
    circles_pack_shape.hpp \
    color_constants.hpp \
    colored_symbol_shape.hpp \
    custom_features_context.hpp \
    drape_api.hpp \
    drape_api_builder.hpp \
    drape_api_renderer.hpp \
    drape_engine.hpp \
    drape_hints.hpp \
    drape_measurer.hpp \
    engine_context.hpp \
    frontend_renderer.hpp \
    gps_track_point.hpp \
    gps_track_renderer.hpp \
    line_shape.hpp \
    line_shape_helper.hpp \
    map_data_provider.hpp \
    map_shape.hpp \
    message.hpp \
    message_acceptor.hpp \
    message_queue.hpp \
    message_subclasses.hpp \
    metaline_manager.hpp \
    my_position.hpp \
    my_position_controller.hpp \
    navigator.hpp \
    overlay_batcher.hpp \
    overlays_tracker.hpp \
    path_symbol_shape.hpp \
    path_text_handle.hpp \
    path_text_shape.hpp \
    poi_symbol_shape.hpp \
    postprocess_renderer.hpp \
    read_manager.hpp \
    read_metaline_task.hpp \
    read_mwm_task.hpp \
    render_group.hpp \
    render_node.hpp \
    render_state.hpp \
    requested_tiles.hpp \
    route_builder.hpp \
    route_renderer.hpp \
    route_shape.hpp \
    rule_drawer.hpp \
    scenario_manager.hpp \
    screen_animations.hpp \
    screen_operations.hpp \
    screen_quad_renderer.hpp \
    selection_shape.hpp \
    shader_def.hpp \
    shape_view_params.hpp \
    stylist.hpp \
    text_handle.hpp \
    text_layout.hpp \
    text_shape.hpp \
    threads_commutator.hpp \
    tile_info.hpp \
    tile_key.hpp \
    tile_utils.hpp \
    traffic_generator.hpp \
    traffic_renderer.hpp \
    user_event_stream.hpp \
    user_mark_generator.hpp \
    user_mark_shapes.hpp \
    user_marks_provider.hpp \
    visual_params.hpp \
    kinetic_scroller.hpp \

OTHER_FILES += \
    shaders/area.vsh.glsl \
    shaders/area3d.vsh.glsl \
    shaders/area3d_outline.vsh.glsl \
    shaders/arrow3d.fsh.glsl \
    shaders/arrow3d.vsh.glsl \
    shaders/arrow3d_outline.fsh.glsl \
    shaders/arrow3d_shadow.fsh.glsl \
    shaders/arrow3d_shadow.vsh.glsl \
    shaders/circle.fsh.glsl \
    shaders/circle.vsh.glsl \
    shaders/circle_point.fsh.glsl \
    shaders/circle_point.vsh.glsl \
    shaders/colored_symbol.fsh.glsl \
    shaders/colored_symbol.vsh.glsl \
    shaders/colored_symbol_billboard.vsh.glsl \
    shaders/dashed_line.fsh.glsl \
    shaders/dashed_line.vsh.glsl \
    shaders/debug_rect.fsh.glsl \
    shaders/debug_rect.vsh.glsl \
    shaders/discarded_texturing.fsh.glsl \
    shaders/hatching_area.fsh.glsl \
    shaders/hatching_area.vsh.glsl \
    shaders/line.fsh.glsl \
    shaders/line.vsh.glsl \
    shaders/masked_texturing.fsh.glsl \
    shaders/masked_texturing.vsh.glsl \
    shaders/masked_texturing_billboard.vsh.glsl \
    shaders/my_position.vsh.glsl \
    shaders/path_symbol.vsh.glsl \
    shaders/position_accuracy3d.vsh.glsl \
    shaders/route.fsh.glsl \
    shaders/route.vsh.glsl \
    shaders/route_arrow.fsh.glsl \
    shaders/route_arrow.vsh.glsl \
    shaders/route_dash.fsh.glsl \
    shaders/ruler.vsh.glsl \
    shaders/screen_quad.vsh.glsl \
    shaders/shader_index.txt \
    shaders/shaders_lib.glsl \
    shaders/smaa_blending_weight.fsh.glsl \
    shaders/smaa_blending_weight.vsh.glsl \
    shaders/smaa_edges.fsh.glsl \
    shaders/smaa_edges.vsh.glsl \
    shaders/smaa_final.fsh.glsl \
    shaders/smaa_final.vsh.glsl \
    shaders/solid_color.fsh.glsl \
    shaders/text.fsh.glsl \
    shaders/text.vsh.glsl \
    shaders/text_billboard.vsh.glsl \
    shaders/text_fixed.fsh.glsl \
    shaders/text_outlined.vsh.glsl \
    shaders/text_outlined_billboard.vsh.glsl \
    shaders/text_outlined_gui.vsh.glsl \
    shaders/texturing.fsh.glsl \
    shaders/texturing.vsh.glsl \
    shaders/texturing3d.fsh.glsl \
    shaders/texturing_billboard.vsh.glsl \
    shaders/texturing_gui.vsh.glsl \
    shaders/traffic.fsh.glsl \
    shaders/traffic.vsh.glsl \
    shaders/traffic_line.fsh.glsl \
    shaders/traffic_line.vsh.glsl \
    shaders/user_mark.vsh.glsl \
    shaders/user_mark_billboard.vsh.glsl \
